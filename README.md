국비지원 프로젝트

팀명 : uniform

--

root_context.xml에
<!--
<bean id="hikariConfig" class="com.zaxxer.hikari.HikariConfig">
		 <property name="driverClassName" value="oracle.jdbc.driver.OracleDriver"></property> 
		<property name="driverClassName"
			value="net.sf.log4jdbc.sql.jdbcapi.DriverSpy"></property>
		<property name="jdbcUrl"
			value="jdbc:log4jdbc:oracle:thin:@localhost:32769:XE"></property>
		<property name="username" value="book_ex"></property>
		<property name="password" value="book_ex"></property>
</bean>-->

hicarkConfig bean property 자기 자신에 맞게끔 변경해주세요!.

remote Server에 PUSH,PULL 할 때 master 브랜치가 아닌 uniform 브랜치를 이용해서 작업해주세요.


--

tomcat에서 context path를 '/'로 지정해주세요.
뷰에서 Resource들을 절대경로로 표기해놨기 때문에 '/'가 아니라면 다 바꿔주셔야합니다
