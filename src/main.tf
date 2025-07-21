resource "aws_lb" "test_lb" {
  name               = "test-lb"
  internal           = false
  load_balancer_type = "application"

  subnets = ["subnet-03fa4f819e17b8107", "subnet-0533430bf280ae720"] # Replace with your subnet IDs

  tags = {
    Name = "test-lb"
  }
}

resource "aws_lb_listener" "http_listeners" {
  count             = length(var.listeners)
  load_balancer_arn = aws_lb.test_lb.arn
  port              = var.listeners[count.index].port
  protocol          = var.listeners[count.index].protocol

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Default response"
      status_code  = "200"
    }
  }
}

# resource "aws_lb_listener_certificate" "ssl_certificates" {
#   count          = length(var.listeners)
#   listener_arn   = aws_lb_listener.http_listeners[count.index].arn
#   certificate_arn = var.listeners[count.index].ssl_cert_arn

#   # Optional: certificate_chain can be specified if needed
#   # certificate_chain = var.listeners[count.index].ssl_cert_chain
# }
