#### If kubernetes image pull has some issues
1. Add image registry to the `kubeadm init` command as below
2. `kubeadm init --pod-network-cidr=10.222.0.0/16 --service-cidr=10.111.0.0/24 `
          `--apiserver-advertise-address=192.168.0.182 `
          `--image-repository registry.aliyuncs.com/google_containers`
          
#### Ubuntu kubernetes repo list
1. Add this `deb http://packages.cloud.google.com/apt/ kubernetes-xenial main`

#### gpg: no valid OpenPGP data found.
1. Do this `curl -4 -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -`
