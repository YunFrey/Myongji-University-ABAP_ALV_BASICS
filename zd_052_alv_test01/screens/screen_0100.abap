****************************************************************																																
*   This file was generated by Direct Download Enterprise.     *																																
*   Please do not change it manually.                          *																																
****************************************************************																																
%_DYNPRO																																
ZD_052_ALV_TEST01																																
0100																																
753																																
                40																																
%_HEADER																																
ZD_052_ALV_TEST01                       0100 0100     25110192 37  0  0 27121  0G E                              20230713032627																																
%_DESCRIPTION																																
SCREEN 100																																
%_FIELDS																																
CON1			110	00	30	00	30	00	  1	  2		  0	  0	  0		 25	U				 12	 55	101									
OK_CODE		CHAR	 20	80	10	00	00	00	255	  1	O	  0	  0	  0		  0					  0	  0								____________________		
%_FLOWLOGIC																																
PROCESS BEFORE OUTPUT.																																
 MODULE STATUS_0100.																																
 "스크린 페인터에서 만든 컨테이너를 PBO에 연결시키기																																
 MODULE set_alv.																																
																																
																																
PROCESS AFTER INPUT.																																
 "USER COMMAND 가 수행되기 이전에 프로그램을 종료할 EXIT 모듈 생성																																
 MODULE exit AT EXIT-COMMAND. "EXIT COMMAND 시 exit 모듈 실행																																
*MODULE USER_COMMAND_0100.																																
