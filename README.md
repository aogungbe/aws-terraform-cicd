# AWS CI/CD pipeline using Terraform and GitHub Actions

This project demonstrates **cloud automation** using [Terraform](https://www.terraform.io/) and [GitHub Actions](https://docs.github.com/en/actions) to deploy and manage AWS infrastructure as code.

---

## 🚀 What This Project Does

- **Automates AWS resource creation** with Terraform
- **Uses GitHub Actions** to run Terraform automatically on every push to `main`
- **Provisions:**
  - An EC2 instance (Amazon Linux 2)
  - A Security Group (allowing SSH)
  - An S3 bucket

---

## 🏗️ How It Works

1. **Edit Terraform code** (`main.tf`)
2. **Push changes to GitHub**
3. **GitHub Actions runs Terraform**:
    - `terraform init` (initialize)
    - `terraform plan` (preview)
    - `terraform apply` (deploy)
4. AWS resources are **created or updated automatically**

---

## 🧩 Project Structure
.
├── main.tf                   # Main Terraform configuration
├── .gitignore                # Excludes Terraform state/cache
├── .github/
│   └── workflows/
│       └── terraform.yml     # GitHub Actions workflow
└── README.md                 # Project documentation

---

## 🔐 Security

- **AWS secrets** (`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`) are set as [GitHub repository secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets), NOT in code.
- The `.terraform/` directory and all Terraform state files are **gitignored** (not committed).

---

## 💡 How to Use This Project
1. **Fork or clone this repository**
2. **Create an AWS IAM user** with programmatic access and permissions for EC2, S3, and VPC
3. **Use `aws configure` locally** (optional, for your own tests)  
   - Run `aws configure` and enter your AWS Access Key ID and Secret Access Key
4. **Add your AWS credentials as GitHub Secrets**:  
   - Go to your GitHub repo > Settings > Secrets and variables > Actions
   - Add two secrets:  
     - `AWS_ACCESS_KEY_ID`
     - `AWS_SECRET_ACCESS_KEY`
5. **Edit the `main.tf` file as desired**
6. **Commit and push to `main`**

---


## License

MIT (or your choice)
