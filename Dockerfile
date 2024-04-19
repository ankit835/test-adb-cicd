FROM ubuntu:20.04

RUN apt update

RUN apt clean

RUN apt install -y python3 
RUN apt update -y
RUN apt install python3-pip -y
 
RUN apt install git -y
RUN apt update -y

RUN pip install databricks-cli
RUN pip install databricks-cli --upgrade

