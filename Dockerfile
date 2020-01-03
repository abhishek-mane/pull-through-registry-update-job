# Author    : Abhishek Mane <abhishekmane@outlook.in>
# Date      : 03/01/2020

FROM python:3-alpine3.10

LABEL AUTHOR = "abhishekmane@outlook.in"

WORKDIR /opt/app

COPY . ./

RUN pip install --no-cache -r ./pipenv-requirements.txt     \
    && pipenv install --deploy --system                     \
    && pip install --no-cache pip-autoremove                \
    && pip-autoremove pipenv pip-autoremove -y

ENTRYPOINT [ "./app.py" ]