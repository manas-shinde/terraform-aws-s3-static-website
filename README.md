# terraform-aws-s3-static-website
Deploying a static website on AWS S3 using Terraform. Includes bucket creation, file uploads, and public access configuration for website hosting.

This repository contains the Terraform configuration to deploy a static website to an AWS S3 bucket. The configuration is broken down into multiple files to make it more modular and easier to manage.

---

### Prerequisites

To use this configuration, you'll need the following:

- **Terraform:** Ensure you have Terraform installed on your system. You can download it from the official [Terraform website](https://www.terraform.io/downloads.html).
- **AWS Account:** You need an active AWS account with the necessary permissions to create S3 buckets and IAM policies.
- **AWS CLI:** Configure your AWS credentials using the AWS CLI or by setting environment variables.
- **Website Files:** The configuration expects `index.html` and `style.css` files in the root of this directory.

---

### Repository Structure

The Terraform configuration is organized into the following files:

- `versions.tf`: Defines the required Terraform and provider versions.
- `providers.tf`: Configures the AWS provider, specifying the region to deploy resources.
- `s3.tf`: Contains all the resources related to the S3 bucket, including the bucket itself, public access block, bucket policy, and website configuration.
- `uploads.tf`: Manages the upload of your website files (`index.html` and `style.css`) to the S3 bucket.

---

### How to Deploy

Follow these steps to deploy your static website:

1.  **Clone the Repository:**
    ```bash
    git clone https://github.com/manas-shinde/terraform-aws-s3-static-website
    cd terraform-aws-s3-static-website
    ```

2.  **Add Your Website Files:**
    Place your `index.html` and `style.css` files in the root of the repository.

3.  **Initialize Terraform:**
    This command downloads the necessary provider plugins.
    ```bash
    terraform init
    ```

4.  **Review the Plan:**
    This command shows you what Terraform will create, modify, or destroy.
    ```bash
    terraform plan
    ```

5.  **Apply the Configuration:**
    This command creates the resources in your AWS account. Type `yes` when prompted to proceed.
    ```bash
    terraform apply
    ```

6.  **Find Your Website URL:**
    After the apply is complete, Terraform will output the S3 bucket endpoint. You can also find the bucket name in the AWS Management Console to get the public URL for your website.

---

### How to Destroy

To tear down all the resources created by this configuration, run the following command:

```bash
terraform destroy
```
Warning: This will permanently delete your S3 bucket and all its contents.
