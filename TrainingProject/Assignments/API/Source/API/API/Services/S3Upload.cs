using Amazon;
using Amazon.S3;
using Amazon.S3.Transfer;

namespace API.Services
{
    public class S3Upload
    {
        private readonly IConfiguration _config;

        public S3Upload(IConfiguration config)
        {
            _config = config;
        }

        public async Task<string> UploadPoster(IFormFile file)
        {
            return await Upload(file, "Posters");
        }
        public async Task<string> UploadTrailer(IFormFile file)
        {
            return await Upload(file, "Trailers");
        }
        public async Task<string> UploadProfile(IFormFile file)
        {
            return await Upload(file, "Profiles");
        }
        public async Task<string> UploadLogo(IFormFile file)
        {
            return await Upload(file, "Assets");
        }

        public async Task<string> UploadFacility(IFormFile file)
        {
            return await Upload(file, "Facilities");
        }

        public async Task<string> Upload(IFormFile file, string folder)
        {
            var region = RegionEndpoint.APSouth1;
            var accessKey = _config.GetSection("aws:access-key-id").Value;
            var secretKey = _config.GetSection("aws:access-secret-key").Value;
            var bucketName = _config.GetSection("aws:bucket-name").Value;
            var client = new AmazonS3Client(accessKey, secretKey, region);
            var t = new TransferUtility(client);
            var destinationKey = $"BookMyShow/{folder}/{DateTime.Now.ToBinary().ToString() + file.FileName}";
            var uploadRequest = new TransferUtilityUploadRequest()
            {
                BucketName = bucketName,
                Key = destinationKey,
                InputStream = file.OpenReadStream()
            };
            await t.UploadAsync(uploadRequest);

            var publicURL = $"https://{bucketName}.s3.{region.SystemName}.amazonaws.com/{destinationKey}";

            return publicURL;
        }
    }
}
