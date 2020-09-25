/*
 * Class Description: This class acts as a Service that allows text messaging based on credentials.
 */
package services;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

/**
 * Class Description: This class acts as a Service that allows text messaging based on credentials.
 *
 * @author Nguyen Khanh Duy Phan
 */
public class SmsSender {

    // Find your Account Sid and Auth Token at twilio.com/console
    private static final String ACCOUNT_SID
            = "AC0f357c17e2dd6e0a6b65a08fa847e9b4";
    private static final String AUTH_TOKEN
            = "3f11860fb56a2ba024d418b037dc3b5c";
    private static final String MY_PHONE_NUM = "+15873332747";
    
    public static boolean confirm(String customerPhone) throws NullPointerException 
    {
        String message = "Dear customer,\nThank you for making order(s) at our restaurant. Your order are being processed. We will send you a update when it's completed.\nThank you for your paitient.";
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
        Message confirmMessage = Message.creator(new PhoneNumber(customerPhone), new PhoneNumber(MY_PHONE_NUM), message).create();
        try 
        {
            confirmMessage.getSid();
            return true;
        } catch (NullPointerException e) 
        {
            System.out.println("Confirm Message cannot be sent!!!");
        }
        return false;
    }
    
    public static boolean complete(String customerPhone) throws NullPointerException 
    {
        String message = "Dear customer,\nThank you for your paitient. Your order are completed and sent out for delivery.\nEnjoy.";
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
        Message completeMessage = Message.creator(new PhoneNumber(customerPhone), new PhoneNumber(MY_PHONE_NUM), message).create();
        try 
        {
            completeMessage.getSid();
            return true;
        } catch (NullPointerException e) 
        {
            System.out.println("Complete Message cannot be sent!!!");
        }
        return false;
    }
    
    public static boolean voidSMS(String customerPhone, String reason) throws NullPointerException 
    {
        String message = "Thank you for your order.\nUnfortunately, your order has been cancelled due to " + reason + "\nPlease, review your order or make a new order.\nThank you.";
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
        Message completeMessage = Message.creator(new PhoneNumber(customerPhone), new PhoneNumber(MY_PHONE_NUM), message).create();
        try 
        {
            completeMessage.getSid();
            return true;
        } catch (NullPointerException e) 
        {
            System.out.println("Void Message cannot be sent!!!");
        }
        return false;
    }
}
