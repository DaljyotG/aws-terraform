BUCKET_NAME="${1:-my-terraform-state-bucket}"
DYNAMODB_TABLE="${2:-terraform-state-locks}"
AWS_REGION="us-east-1"

# Create S3 bucket
aws s3api create-bucket --bucket "${BUCKET_NAME}" --region "${AWS_REGION}"

# Enable versioning
aws s3api put-bucket-versioning --bucket "${BUCKET_NAME}" --versioning-configuration Status=Enabled

# Create DynamoDB table
aws dynamodb create-table \
  --table-name "${DYNAMODB_TABLE}" \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST \
  --region "${AWS_REGION}"

echo "bucket: ${BUCKET_NAME} table: ${DYNAMODB_TABLE}"
