FROM ubuntu:latest
#ENV TZ=Europe/Helsinki
RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone
RUN apt-get update && apt-get install -y python3 python3-pip
#RUN apt-get install -y apt-utils
RUN apt-get install -y tzdata
RUN apt-get install -y libglib2.0-dev
RUN apt-get install -y libgtk2.0-0
RUN apt-get install -y libsm6 libxext6
RUN apt-get install -y libxrender-dev
RUN pip3 install imutils
RUN pip3 install streamlit
RUN pip3 install numpy
#RUN pip3 install opencv-python 
RUN pip3 install opencv-python==4.1.2.30
RUN pip3 install Pillow
EXPOSE 8501

WORKDIR /app
copy . /app
CMD ["streamlit", "run", "app.py"]
