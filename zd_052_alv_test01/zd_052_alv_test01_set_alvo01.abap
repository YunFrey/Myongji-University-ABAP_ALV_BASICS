*----------------------------------------------------------------------*
***INCLUDE ZD_052_ALV_TEST01_SET_ALVO01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Module SET_ALV OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE set_alv OUTPUT.
 CHECK go_container IS INITIAL.
* OBJECT 실습
"Ctrl+Space
 CREATE OBJECT go_container
   EXPORTING
     repid                       = sy-repid                 " Report to Which This Docking Control is Linked
     dynnr                       = sy-dynnr                 " Screen to Which This Docking Control is Linked
     extension                   = 50.
 IF SY-SUBRC <> 0.
 ENDIF.

 CREATE OBJECT go_grid
   EXPORTING
     i_parent                = go_container                  " Parent Container
   .
 IF SY-SUBRC <> 0.
 ENDIF.

* Field Catalog 정의
" 구조체로 옵션 지정한 뒤 테이블에 추가
* [CARRID]
 gs_fcat-fieldname = 'CARRID'.
 gs_fcat-coltext = 'Carrid ID'.
 gs_fcat-just = 'C'. "정렬
 gs_fcat-outputlen = '2'. "문자열 넓이
 APPEND gs_fcat TO gt_fcat.

* [CONNID]
 gs_fcat-fieldname = 'CONNID'.
 gs_fcat-coltext = 'Flight Number'.
 gs_fcat-just = 'C'. "정렬
 gs_fcat-outputlen = '4'. "문자열 넓이
 APPEND gs_fcat TO gt_fcat.

* Layout 설정
 gs_layout-grid_title = '소제목'.
 gs_layout-zebra = 'X'. "지브라
 gs_layout-CWIDTH_OPT = 'X'. "칼럼 길이 지정


 CALL METHOD go_grid->set_table_for_first_display
   EXPORTING
*     i_buffer_active               =                  " Buffering Active
*     i_bypassing_buffer            =                  " Switch Off Buffer
*     i_consistency_check           =                  " Starting Consistency Check for Interface Error Recognition
      i_structure_name              = 'SFLIGHT'          " Internal Output Table Structure Name
*     is_variant                    =                  " Layout
*     i_save                        =                  " Save Layout
*     i_default                     = 'X'              " Default Display Variant
      is_layout                     = gs_layout                  " Layout
*     is_print                      =                  " Print Control
*     it_special_groups             =                  " Field Groups
*     it_toolbar_excluding          =                  " Excluded Toolbar Standard Functions
*     it_hyperlink                  =                  " Hyperlinks
*     it_alv_graphics               =                  " Table of Structure DTC_S_TC
*     it_except_qinfo               =                  " Table for Exception Tooltip
*     ir_salv_adapter               =                  " Interface ALV Adapter
   CHANGING
     it_outtab                     = gt_sflight                  " Output Table
     it_fieldcatalog               = gt_fcat                  " Field Catalog "여기엔 테이블이 들어가야 함
*     it_sort                       =                  " Sort Criteria
*     it_filter                     =                  " Filter Criteria
*   EXCEPTIONS
*     invalid_parameter_combination = 1                " Wrong Parameter
*     program_error                 = 2                " Program Errors
*     too_many_lines                = 3                " Too many Rows in Ready for Input Grid
*     others                        = 4
   .
 IF SY-SUBRC <> 0.
*  MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*    WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
 ENDIF.

ENDMODULE.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
