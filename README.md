# ICT171 Assignment 2 – Cloud Web Server Project

**Student Name:** Muhammad Mobeen  
**Student ID:** 34770141  
**Unit:** ICT171 – Introduction to Server Environments  
**Project Title:** Cybersecurity Awareness Website on AWS EC2  

---

## Project Summary

This project involved deploying a static HTML-based cybersecurity awareness website hosted on a cloud-based Ubuntu EC2 instance provided by Amazon Web Services (AWS). The site was set up with Apache2, secured using a self-signed SSL certificate, and integrated with GitHub for version control. The goal was to simulate a real-world IaaS deployment scenario while documenting each step for reproducibility and learning.

---

## Public Access Details

- **Public IP Address:** `54.79.239.149`  
- **DNS Name:** *Not configured (static IP used instead)*
- **GitHub Repository:** [https://github.com/mobeensharif02/ICT171-Assignment2-Mobeen](https://github.com/mobeensharif02/ICT171-Assignment2-Mobeen)

---

## Steps to Reproduce the Server

### 1. Launch EC2 Instance on AWS
- Select **Ubuntu 22.04 LTS**
- Choose instance type: `t2.micro`
- Create/download key pair: `mobeen-project-key.pem`
- Configure Security Group:
  - Allow port `22` (SSH), `80` (HTTP), `443` (HTTPS)

### 2. SSH into Your EC2 Instance
```bash
ssh -i "mobeen-project-key.pem" ubuntu@54.79.239.149

## Update System and Install Apache
sudo apt update
sudo apt install apache2 -y

## Enable UFW Firewall & Allow Web Ports
sudo ufw allow 'Apache Full'
sudo ufw enable

## Enable HTTPS With Self-signed SSL
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/apache-selfsigned.key \
-out /etc/ssl/certs/apache-selfsigned.crt

sudo a2enmod ssl
sudo a2ensite default-ssl.conf

sudo nano /etc/apache2/sites-available/default-ssl.conf
# Update SSLCertificateFile and SSLCertificateKeyFile paths

sudo systemctl reload apache2
Now access the site via https://54.79.239.149
```
### References & Acknowledgements

- Apache2 monitoring script inspired by community solution:  
  https://askubuntu.com/questions/611953/check-if-apache-is-running-else-start-apache

- HTML layout adapted from Bootstrap 5 Card example:  
  https://getbootstrap.com/docs/5.3/components/card/

- SSL certificate generation command from official OpenSSL documentation:  
  https://www.openssl.org/docs/manmaster/man1/openssl-req.html

- EC2 setup and hosting practices learned through ICT171 lectures, labs, and AWS documentation.





