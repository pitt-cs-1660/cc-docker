# Verifying Your Image in AWS ECR

After your GitHub Actions workflow pushes the image, you should verify it exists in your ECR repository.

---

## Using the AWS Console

1. Log in to the [AWS Console](https://console.aws.amazon.com/).
2. Navigate to **Amazon ECR** (search "ECR" in the top search bar).
3. Click **Repositories** in the left sidebar.
4. Find your repository and click on it.
5. You should see your image listed with the `latest` tag.

---

## Using the AWS CLI

Make sure you have the [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) installed and configured with your credentials.

### list images in your repository

```bash
aws ecr list-images --repository-name <repo-name> --region <region>
```

you should see output like:

```json
{
    "imageIds": [
        {
            "imageDigest": "sha256:abc123...",
            "imageTag": "latest"
        }
    ]
}
```

### describe the image for more details

```bash
aws ecr describe-images --repository-name <repo-name> --region <region>
```

---

## Pulling and Running the Image from ECR

you can pull your image from ECR to verify it runs correctly.

### authenticate docker with ecr

```bash
aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <account-id>.dkr.ecr.<region>.amazonaws.com
```

### pull the image

```bash
docker pull <account-id>.dkr.ecr.<region>.amazonaws.com/<repo-name>:latest
```

### run the image

```bash
docker run -p 8080:8080 -it --rm <account-id>.dkr.ecr.<region>.amazonaws.com/<repo-name>:latest
```

visit `http://localhost:8080` in your browser to confirm the application is running.
