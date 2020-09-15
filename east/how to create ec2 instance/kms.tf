data "aws_caller_identity" "current" {}

resource "aws_kms_key" "xfs" {
  description             = "KMS key for xfs app"
  deletion_window_in_days = 10
  policy = "${data.aws_iam_policy_document.policy}"
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
