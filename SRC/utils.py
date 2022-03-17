from kavenegar import *


def send_otp_code(phone_number, code):
    try:
        api = KavenegarAPI('544C43302B2F4B6968356D61492F2B6D79736E70677979317A4A6E4A4F6E3255437147765A42643369424D3D')
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