using Amazon;
using Amazon.S3;
using Amazon.S3.Transfer;

namespace fullstack.Services
{
    public class S3Upload
    {
        private readonly string bucket = "nirmal-fullstack";
        private readonly RegionEndpoint regionEndpoint = RegionEndpoint.APSouth1;
        public async Task<string> UploadImage(IFormFile file)
        {
            var destinationKey = $"Fullstack/{file.FileName.ToLower()}";
            var client = new AmazonS3Client(regionEndpoint);
            var t = new TransferUtility(client);
            var upload_request = new TransferUtilityUploadRequest()
            {
                BucketName = bucket,
                Key = destinationKey,
                InputStream = file.OpenReadStream(),
            };
            await t.UploadAsync(upload_request);

            var URL = $"https://{bucket}.s3.{regionEndpoint.SystemName}.amazonaws.com/{destinationKey}";
            return URL;
        }
    }
}
