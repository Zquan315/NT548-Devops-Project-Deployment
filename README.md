# Deploy a Full-Stack React & NestJS Web Application using AWS CI/CD Pipeline Using Terraform

## Hướng dẫn chạy mã nguồn để thiết lập AWS CICD pipeline

- Tạo một key pair tên "nhom16", có thể đặt tên khác thì trong file terraform.tfvars cũng đổi giá trị của key-name
- Tạo một S3 bucket để lưu state của workspace 1 - Infrastructure
  
  ``` bash
  cd create-s3-tfstate-and-key-pair
  terraform init
  terraform apply
  ```
  
- Tạo hạ tầng gồm VPC, subnet, route table, iam, EC2 để triển khai và Code commit để lưu mã nguồn triển khai
  ``` bash
  
  cd ../create-infrastructure
  terraform init
  terraform apply
  ```
  
- Vào IAM -> user được tạo (nhom16-user), vào tab Credentials tạo một Credentials ở tab HTTPS Git credentials for AWS CodeCommit và tải về
- Vào code commit clone code về, khi đó sẽ có yêu cầu xác thực -> lấy user và password khi khi từ file credentials được tạo ở trên, sau đó paste mã nguồn từ [Mã nguồn](https://github.com/Zquan315/NT548-DevOps-Project), copy DNS của ALB dán vào /client/.env

  ``` bash
  Ví dụ: REACT_APP_API_URL=http://nhom16-alb-594249954.us-east-1.elb.amazonaws.com
  ```
  
- Sau đó push code lên. Sau khi push code thành công, tiến hành tạo pipeline

  ``` bash
  cd ../create-pipeline
  terraform init
  terraform apply
  ```
  
- Đợi pipeline chạy thành công, truy cập <ip_public>:3000 để hiển thị trang web. Server <ip_public>:5000/students
