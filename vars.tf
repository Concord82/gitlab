variable "proxmox_ip" {
    description = "Proxmox server address"  
    type        = string  
}

variable "api_token_id" {
    description = "Proxmox API token Id"  
    type        = string  
}

variable "api_token_secret" {
    description = "Proxmox API token secret"
    type        = string  
}

variable "pm_user" {
    type = string
}

variable "pm_password" {
    type = string
}