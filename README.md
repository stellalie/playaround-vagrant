To run and install the required plugin:
`vagrant plugin install vagrant-nfs_guest`
`vagrant plugin install vagrant-git`
`vagrant up`

Then SSH to your guest machine to highstate manually
`vagrant ssh`
`sudo salt-call --local state.highstate -l debug`

Note: I couldn't be bothered to write a shell script for above for now :/