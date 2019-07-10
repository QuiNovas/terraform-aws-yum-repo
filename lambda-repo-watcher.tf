data "aws_iam_policy_document" "repo_watcher" {
  statement {
    actions = [
      "codebuild:StartBuild",
    ]
    resources = [
      aws_codebuild_project.yum_repo.id,
    ]
    sid = "AllowStartBuild"
  }
}

resource "aws_iam_policy" "repo_watcher" {
  name   = "RepoWatcherBuildAccess"
  policy = data.aws_iam_policy_document.repo_watcher.json
}

module "repo_watcher" {
  dead_letter_arn = var.dead_letter_arn
  environment_variables = {
    PROJECT_NAME = aws_codebuild_project.yum_repo.name
  }
  handler       = "function.handler"
  kms_key_arn   = var.kms_key_arn
  l3_object_key = local.codebuild_runner_object_key
  name          = "${var.name_prefix}-yum-repo-watcher"
  policy_arns = [
    aws_iam_policy.repo_watcher.arn,
  ]
  runtime           = "python2.7"
  source            = "QuiNovas/lambdalambdalambda/aws"
  version           = "3.0.1"
}

resource "aws_lambda_permission" "repo_watcher" {
  action        = "lambda:InvokeFunction"
  function_name = module.repo_watcher.arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.yum_repo.arn
  statement_id  = "AllowExecutionFromS3Bucket"
}

