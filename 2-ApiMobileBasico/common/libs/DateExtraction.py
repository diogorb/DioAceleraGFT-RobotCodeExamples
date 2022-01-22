from datetime import datetime
from dateutil.relativedelta import relativedelta

def return_inicio_do_mes_anterior():
    strDate = datetime.today()
    Subtracted_date = strDate + relativedelta(months=-1)
    Date = Subtracted_date.strftime('01%m%Y')
    return Date

def return_inicio_dois_meses_antes():
    strDate = datetime.today()
    Subtracted_date = strDate + relativedelta(months=-2)
    Date = Subtracted_date.strftime('01%m%Y')
    return Date

def return_inicio_tres_meses_antes():
    strDate = datetime.today()
    Subtracted_date = strDate + relativedelta(months=-3)
    Date = Subtracted_date.strftime('01%m%Y')
    return Date

def return_inicio_quatro_meses_antes():
    strDate = datetime.today()
    Subtracted_date = strDate + relativedelta(months=-4)
    Date = Subtracted_date.strftime('01%m%Y')
    return Date

def return_vinte_anos_antes():
    strDate = datetime.today()
    Subtracted_date = strDate + relativedelta(years=-20)
    Date = Subtracted_date.strftime('01%m%Y')
    return Date