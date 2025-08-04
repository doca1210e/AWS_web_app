import requests

AWS_METADATA_URL = "http://169.254.169.254/latest/meta-data"

def get_instance_metadata():
    """
    Fetches the AWS Region and Availability Zone using EC2 Metadata API.
    """
    try:
        # Fetch availability zone
        az = requests.get(f"{AWS_METADATA_URL}/placement/availability-zone").text.strip()
        # Derive region from AZ (AZ is usually region + letter)
        region = az[:-1]
        return region, az
    except Exception as ex:
        return "unknown-region", "unknown-az"
    