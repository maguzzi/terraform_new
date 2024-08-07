data "aws_iam_policy_document" "write_to_sqs" {
  statement {
    sid    = "First"
    effect = "Allow"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions   = ["sqs:SendMessage"]
    resources = [aws_sqs_queue.read_topic_queue.arn]

    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values   = [aws_sns_topic.push_topic.arn]
    }
  }
}

resource "aws_sqs_queue_policy" "write_to_sqs_policy" {
  queue_url = aws_sqs_queue.read_topic_queue.url
  policy    = data.aws_iam_policy_document.write_to_sqs.json
}