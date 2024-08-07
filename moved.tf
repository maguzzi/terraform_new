moved {
  from = aws_kms_key.sns_key
  to = module.kms_key_outside.aws_kms_key.sns_key
}