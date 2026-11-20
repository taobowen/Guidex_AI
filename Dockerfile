# Start from an official NVIDIA PyTorch image with CUDA support
FROM nvcr.io/nvidia/pytorch:24.02-py3

# Set up working directory
WORKDIR /opt/ml/code

# Copy your local code into the container
COPY . /opt/ml/code

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# (Optional) Install SageMaker SDK if you plan to run inside SageMaker
RUN pip install sagemaker boto3

# Make Python output unbuffered (for real-time logs)
ENV PYTHONUNBUFFERED=TRUE

# Set default command when container starts
ENTRYPOINT ["python", "train.py"]
