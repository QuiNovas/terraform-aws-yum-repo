# terraform-aws-yum-repo

This module creates a versioned, website, public S3 bucket to serve as the Yum repository, 
a lambda function to watch the bucket and run codebuild when new objects (RPMs) appear in the bucket,
and a codebuild to index the repo and upload the results to the S3 bucket.

## Variables
| Variable | Type | Required | Description | Default |
| --------:|:----:|:--------:|:----------- |:------- |
| log_bucket_id | String | Y | The name or id of the log bucket to use for S3 server logging | None |
| name_prefix | String | Y | The name prefix to use when naming the created resources | None|
| repo_locations | List | Y | The locations within the bucket to create repos at. This is used to create repos for specific architectures if desired | None |
| repo_whitelists | List | N | If present, restricts access to the repo to the listed CIDR blocks | 0.0.0.0/0 |

## Outputs
| Name | Description |
| ----:|:----------- |
| website_endpoint | The endpoint of the created S3 bucket |

## Authors

Module managed by Quinovas (https://github.com/QuiNovas)

## License

Apache License, Version 2.0, January 2004 (http://www.apache.org/licenses/). See LICENSE for full details.