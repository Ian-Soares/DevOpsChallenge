FROM python:latest

WORKDIR /app

COPY ./requirements.txt /app/

RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

COPY . /app/

ENV PYTHONPATH='${PYTHONPATH}:/app/src'

EXPOSE 8000

CMD ["gunicorn", "-w", "4", "-k", "uvicorn.workers.UvicornWorker", "-b", "0.0.0.0:8000", "src.api:app"]