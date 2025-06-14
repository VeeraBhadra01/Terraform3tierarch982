# Creating Launch template for Web tier AutoScaling Group
resource "aws_launch_template" "web-lt" {
    name = var.launch-template-name
    image_id = data.aws_ami.ami.image_id
    instance_type = var.instance_type

    vpc_security_group_ids = [data.aws_security_group.web-sg.id]

    user_data = filebase64("./modules/aws-autoscaling/deploy.sh")
  
}

resource "aws_autoscaling_group" "web-asg" {
    name = var.asg-name
    vpc_zone_identifier = [data.aws_subnet.public-subnet1.id, data.aws_subnet.public-subnet2.id]

    launch_template {
      id = aws_launch_template.web-lt.id
      version = aws_launch_template.web-lt.latest_version
    }

    min_size = 2
    max_size = 4
    health_check_type = "ELB"
    target_group_arns = [data.aws_lb_target_group.tg.arn]
    force_delete = true

    tag {
      key = "Name"
      value = "web-asg"
      propagate_at_launch = true
    }

  }

  resource "aws_autoscaling_policy" "web-custom-policy" {
    name = "custom-cpu-policy"
    autoscaling_group_name = aws_autoscaling_group.web-asg.id
    adjustment_type = "ChangeInCapacity"
    scaling_adjustment = 1
    cooldown = 60
    policy_type = "SimpleScaling"
 
 }

 resource "aws_cloudwatch_metric_alarm" "web-custom-cpu-alarm" {
    alarm_name = "custom-cpu-alarm"
    alarm_description = "alarm when cpu usage increases"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = 2
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    period = 120
    statistic = "Average"
    threshold = "70"

    dimensions = {
        "AutoscalingGroupName" : aws_autoscaling_group.web-asg.name
    }

    actions_enabled = true
    
    alarm_actions = [aws_autoscaling_policy.web-custom-policy.arn]

}

resource "aws_autoscaling_policy" "web-custom-cpu-policy-scaledown" {
  name                   = "custom-cpu-policy-scaledown"
  autoscaling_group_name = aws_autoscaling_group.web-asg.id
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = -1
  cooldown               = 60
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "web-custom-cpu-alarm-scaledown" {
  alarm_name          = "custom-cpu-alarm-scaledown"
  alarm_description   = "alarm when cpu usage decreases"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = "50"

  dimensions = {
    "AutoScalingGroupName" : aws_autoscaling_group.web-asg.name
  }
  actions_enabled = true

  alarm_actions = [aws_autoscaling_policy.web-custom-cpu-policy-scaledown.arn]
  
}

