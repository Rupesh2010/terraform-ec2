data "aws_caller_identity" "current" {}

resource "aws_kms_alias" "xfs-alias" {
  count         = "${var.env == dev ? 1 : 0}"
  name          = "alias/xfs-alias"
  target_key_id = aws_kms_key.xfs.key_id
}

resource "aws_kms_key" "xfs" {
  count                   = "${var.env == dev ? 1 : 0}"
  description             = "KMS key for xfs app"
  deletion_window_in_days = 10
  policy = "${data.aws_iam_policy_document.policy.json}"
}

data "aws_iam_policy_document" "policy" {
  statement {
    sid = "1"

    effect = "Allow"

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
      ]
    }

    actions = [
      "kms:*",
    ]

    resources = [
      "*",
    ]
  }
}
