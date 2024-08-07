module "kms_key_outside" {
  source = "./modules/key_module"
}

resource "aws_sns_topic" "push_topic" {
  name              = "maguzzi-push-topic"
  kms_master_key_id = module.kms_key_outside.kms_key_id
}

resource "aws_sqs_queue" "read_topic_queue" {
  name = "maguzzi-read-topic_queue"
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn            = aws_sns_topic.push_topic.arn
  endpoint             = aws_sqs_queue.read_topic_queue.arn
  protocol             = "sqs"
  raw_message_delivery = true
}