# Deploy a Full-Stack React & NestJS Web Application using AWS CI/CD Pipeline Using Terraform

## Hướng dẫn chạy mã nguồn để thiết lập AWS CICD pipeline

- Tạo một key pair tên "nhom16", có thể đặt tên khác thì trong file terraform.tfvars cũng đổi giá trị của key-name
- Tạo một S3 bucket để lưu state của workspace 1 - Infrastructure
  
  ``` bash
  cd create-s3-tfstate
  terraform init
  terraform apply
  ```
  
- Tạo hạ tầng gồm VPC, subnet, route table, iam, EC2 để triển khai và Code commit để lưu mã nguồn triển khai
  ``` bash
  
  cd ../create-infrastructure
  terraform init
  terraform apply
  ```
  
- Vào IAM -> user được tạo (nhom16-user), vào tab Credentials tạo một Credentials ở tab HTTPS Git credentials for AWS CodeCommit
- Vào code commit clone code về, sau đó paste mã nguồn từ [Mã nguồn](https://github.com/Zquan315/NT548-DevOps-Project), copy địa chỉ ip public của EC2 dán vào /client/.env

  ``` bash
  REACT_APP_API_URL=http://<ip_public>:5000
  ```
  
- Sau đó push code lên. Khi clone về sẽ yêu cầu xác thực, mở file credentials vừa tạo để đăng nhập
- Sau khi push code thành công, tiến hành tạo pipeline

  ``` bash
  cd ../create-pipeline
  terraform init
  terraform apply
  ```
  
- Đợi pipeline chạy thành công, truy cập <ip_public>:3000 để hiển thị trang web. Server <ip_public>:5000/students
