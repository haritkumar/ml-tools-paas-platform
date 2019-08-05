### ML tools on PAAS platform
Dockerized ML tools. Tools included in this docker image,

- Python 3.7
- Jupyter
- Panda
- Numpy
- Tensorflow
- Tensorboard

#### Run docker image on local `password: admin`
```sh
docker run -p 8080:8080 haritkumar/ml-framework:latest
```
`Access Here : http://127.0.0.1:8080/`

#### Deploy to openshift
```sh
oc new-app haritkumar/ml-framework:latest --name=jupyter-ml
```


#### Install a pip package in the current Jupyter kernel
```python
import sys
!{sys.executable} -m pip install flask
```

