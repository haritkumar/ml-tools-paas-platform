FROM ubuntu:16.04
COPY get-pip.py /opt/get-pip.py
RUN apt-get update && \
    apt-get -y install software-properties-common apt-utils && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && apt-get -y install python3.7 && \
    python3.7 /opt/get-pip.py && rm /opt/get-pip.py && apt-get clean

RUN pip install jupyter pandas numpy tensorflow tensorboard
RUN mkdir /opt/jupyter && chown -R 1001:1001 /opt/jupyter && chmod -R 777 /opt/jupyter && \
    mkdir /.local && chown -R 1001:1001 /.local && chmod -R 777 /.local && \
    mkdir /.jupyter && chown -R 1001:1001 /.jupyter && chmod -R 777 /.jupyter && \
    chown -R 1001:1001 /usr/local/lib/python3.7 && chmod -R 777 /usr/local/lib/python3.7
COPY jupyter_notebook_config.py /.jupyter/jupyter_notebook_config.py 
COPY sample.ipynb /opt/jupyter/sample.ipynb
WORKDIR /opt/jupyter  
EXPOSE 8080
USER 1001
CMD ["jupyter","notebook","--notebook-dir=/opt/jupyter/","--ip=0.0.0.0","--port=8080"]
