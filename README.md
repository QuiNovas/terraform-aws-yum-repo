# terraform-aws-yum-repo

This module creates a versioned, website, public S3 bucket to serve as the Yum repository, 
a lambda function to watch the bucket and run codebuild when new objects (RPMs) appear in the bucket,
and a codebuild to index the repo and upload the results to the S3 bucket.

## Authors

Module managed by Quinovas (https://github.com/QuiNovas)

## License

Apache License, Version 2.0, January 2004 (http://www.apache.org/licenses/). See LICENSE for full details.