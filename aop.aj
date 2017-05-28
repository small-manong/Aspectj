package com.androidaop.demo;
import android.util.Log;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.JoinPoint;
 
@Aspect   //����ʹ��@AspectJ��ע������class DemoAspect�͵�ͬ�� aspect DemoAspect��
public class DemoAspect {
    staticfinal String TAG = "DemoAspect";
/*
@Pointcut��pointcutҲ�����һ��ע�⣬���ע�������һ�������ģ�����˴���logForActivity()
��ʵ�����������pointcut�����֡�����Ǵ�������pointcut����Ѳ������ͺ����ַŵ�
����pointcut���ֵ�logForActivity�У�Ȼ����@Pointcutע����ʹ�ò�������
��������ǰһ����ֻ��д�����Ƚ�����һ�㡣�������ǻ���ܴ�����������
*/
@Pointcut("execution(* com.androidaop.demo.AopDemoActivity.onCreate(..)) ||"
        +"execution(* com.androidaop.demo.AopDemoActivity.onStart(..))")
public void logForActivity(){};  //ע�⣬�����������Ҫ��ʵ�֣�����Java�������ᱨ��
 
/*
@Before�������Before��advice������after��after -returning����after-throwing�����ڵ�ע���ʽΪ
@After��@AfterReturning��@AfterThrowing��Before���������pointcut���֣�Ȼ����������һ��������ʵ�֡�����˴���log��
*/
    @Before("logForActivity()")
    public void log(JoinPoint joinPoint){
       //����ʹ��Annotation��AspectJ���ԣ�JoinPoint�Ͳ���ֱ���ڴ�����õ����ˣ�����Ҫͨ��
      //�������ݽ�����
       Log.e(TAG, joinPoint.toShortString());
    }
}
    @Before("checkPermssion(securityCheckAnnotation)")
    publicvoid check(JoinPoint joinPoint,SecurityCheckAnnotationsecurityCheckAnnotation){
        //��ע����Ϣ�л�ȡ������Ȩ�ޡ�
       String neededPermission = securityCheckAnnotation.declaredPermission();
       Log.e(TAG, joinPoint.toShortString());
       Log.e(TAG, "\tneeded permission is " + neededPermission);
       return;
    }