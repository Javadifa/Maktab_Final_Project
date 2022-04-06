from kavenegar import *


def send_otp_code(phone_number, code):
    try:
        api = KavenegarAPI('446B66674149504C46656E42303355594364313574664C336B316B6D6E552B34585A4F634F68396A4339343D')
        params = {
            'sender': '',
            'receptor': phone_number,
            'message': f'{code} کد تایید شما '
        }
        response = api.sms_send(params)
        print(response)
    except APIException as e:
        print(e)
    except HTTPException as e:
        print(e)
