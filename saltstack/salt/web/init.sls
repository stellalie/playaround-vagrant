vagrant:
  user:
    - present
    - groups:
        - sudo

install-nvm-package:
    cmd.run:
        - cwd: /home/vagrant/
        - user: vagrant
        - name: |
            wget https://raw.github.com/creationix/nvm/master/install.sh
            sh install.sh
        - unless: test -d /home/vagrant/.nvm

install-node-version-for-web:
    cmd.run:
    - cwd: /home/vagrant/
    - user: vagrant
    - name: |
        source /home/vagrant/.nvm/nvm.sh
        nvm install 0.10.40
        nvm use 0.10.40

fix-stupid-srv-permission:
  cmd.run:
    - name: sudo chown -R $(whoami) /srv/
    - user: vagrant

# TODO: Need to fix this and use proper ssh keys!
clone-our-nodejs-web-repo:
  git.latest:
    - user: vagrant
    - name: https://github.com/stellalie/iot_platform_web_node
    - target: /srv/site/iot_platform_web_node
    - https_user: stellalie
    - https_pass: dc6bdc0dedea212a642cb063bc03c14bfc6b10d2
    - unless: test -d /srv/site/iot_platform_web_node

fix-stupid-npm-permission:
  cmd.run:
    - name: sudo chown -R $(whoami) ~/.npm
    - user: vagrant

npm-install-our-app:
  cmd.run:
    - name: |
        source /home/vagrant/.nvm/nvm.sh;
        nvm use 0.10.40
        npm install
        npm install -g sails
    - cwd: /srv/site/iot_platform_web_node
    - user: vagrant