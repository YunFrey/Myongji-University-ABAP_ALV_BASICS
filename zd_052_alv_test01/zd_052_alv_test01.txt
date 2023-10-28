*&---------------------------------------------------------------------*
*& Report ZD_052_ALV_TEST01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_ALV_TEST01.


" 사용할 테이블 불러오기
TABLES sflight.

" sflight 는 그 자체로 구조체이므로 type table of 로 테이블을 불러온다.
DATA : gt_sflight TYPE TABLE OF sflight.

*Docking Container
DATA : go_container TYPE REF TO cl_gui_docking_container, " Docking COntainer 선언
      go_grid TYPE REF TO cl_gui_alv_grid, " cl_gui_alv_Grid 는 클래스로 이 안에 있는 함수사용 시 REF TO를 사용함
      gt_fcat TYPE lvc_t_fcat, "필드 카탈로그
      gs_fcat TYPE lvc_s_fcat, "
      gs_layout TYPE lvc_s_layo.

*OK_CODE
DATA ok_code TYPE sy-ucomm. "Screen 에서 발생하는 OK_CODE 를 시스템에서 받아오기
*조회 조건
SELECT-OPTIONS: s_carrid FOR sflight-carrid. "필드를 생성하고 테이블의 열과 연결하기

INITIALIZATION.


*
START-OF-SELECTION.
SELECT *
  INTO CORRESPONDING FIELDS OF TABLE gt_sflight
  FROM sflight
  WHERE carrid IN s_carrid.


END-OF-SELECTION.
 "cl_demo_output=>display_data( gt_sflight ).
"스크린 생성
 CALL SCREEN 100.


INCLUDE zd_052_alv_test01_status_01o01.

INCLUDE zd_052_alv_test01_exiti01.

INCLUDE zd_052_alv_test01_set_alvo01.

*GUI Texts
*----------------------------------------------------------
* TITLEBAR 100 --> SFLIGHT 조회

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
