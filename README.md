To run, highstate and install the required plugin:

`vagrant plugin install vagrant-nfs_guest`
`vagrant plugin install vagrant-git`
`vagrant up`

Then, just do highstate manually (it's better with colors):

`vagrant ssh`
`sudo salt-call --local state.highstate -l debug`