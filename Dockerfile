FROM tensorflow/tensorflow:2.4.0-gpu
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/Yuqi92/bigbird.git
RUN ln -s /usr/local/cuda/lib64/libcusolver.so.10 /usr/local/cuda/lib64/libcusolver.so.11
WORKDIR /bigbird
RUN mv bigbird/classifier/run_classifier.py run_classifier.py
RUN sed -i 's/^tensorflow$//g' requirements.txt
RUN cat requirements.txt
RUN pip install -r requirements.txt
ENTRYPOINT ["python", "run_classifier.py"]
