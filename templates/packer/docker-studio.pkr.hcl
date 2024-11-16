packer {
  required_plugins {
    docker = {
      version = ">= 1.0.10"
      source  = "github.com/hashicorp/docker"
    }
    ansible = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

variable "version" {
  type    = string
  default = "x.x.x"
}

source "docker" "studio" {
  image  = "ubuntu:22.04"
  commit = true
  run_command = [
    "-d",
    "-i",
    "-t",
    "{{.Image}}",
    "/bin/bash",
  ]
  changes = [
    "ENV LANG en_US.UTF-8",
    "ENV PATH /opt/poetry-venv/bin:/opt/poetry/bin:/usr/local/go/bin:/usr/local/maven/bin:/usr/local/node/bin:/usr/local/openjdk-jdk/bin:/root/.cargo/bin:/root/go/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
  ]
}

build {
  sources = [
    "source.docker.studio"
  ]

  name = "studio"

  provisioner "shell" {
    inline = [
      "mkdir -p /tmp"
    ]
  }

  provisioner "shell" {
    script = "provisioners/shell/init.sh"
  }

  provisioner "shell" {
    script = "provisioners/shell/info-pre.sh"
  }

  provisioner "ansible-local" {
    playbook_file = "provisioners/ansible/studio.yml"
    galaxy_file = "requirements.yml"
    role_paths = [
      "stage/ansible/roles"
    ]
    collection_paths = [
      "stage/ansible/collections"
    ]
  }

  provisioner "ansible-local" {
    playbook_file = "provisioners/ansible/studio-go.yml"
    galaxy_file = "requirements.yml"
    role_paths = [
      "stage/ansible/roles"
    ]
    collection_paths = [
      "stage/ansible/collections"
    ]
  }

  provisioner "ansible-local" {
    playbook_file = "provisioners/ansible/studio-java.yml"
    galaxy_file = "requirements.yml"
    role_paths = [
      "stage/ansible/roles"
    ]
    collection_paths = [
      "stage/ansible/collections"
    ]
  }

  provisioner "ansible-local" {
    playbook_file = "provisioners/ansible/studio-javascript.yml"
    galaxy_file = "requirements.yml"
    role_paths = [
      "stage/ansible/roles"
    ]
    collection_paths = [
      "stage/ansible/collections"
    ]
  }

  provisioner "ansible-local" {
    playbook_file = "provisioners/ansible/studio-python.yml"
    galaxy_file = "requirements.yml"
    role_paths = [
      "stage/ansible/roles"
    ]
    collection_paths = [
      "stage/ansible/collections"
    ]
  }

  provisioner "ansible-local" {
    playbook_file = "provisioners/ansible/studio-ruby.yml"
    galaxy_file = "requirements.yml"
    role_paths = [
      "stage/ansible/roles"
    ]
    collection_paths = [
      "stage/ansible/collections"
    ]
  }

  provisioner "ansible-local" {
    playbook_file = "provisioners/ansible/studio-rust.yml"
    galaxy_file = "requirements.yml"
    role_paths = [
      "stage/ansible/roles"
    ]
    collection_paths = [
      "stage/ansible/collections"
    ]
  }

  provisioner "shell" {
    script = "provisioners/shell/info-post.sh"
  }

  post-processor "docker-tag" {
    repository = "cliffano/studio"
    tags        = [
      "latest",
      var.version
    ]
  }
}
