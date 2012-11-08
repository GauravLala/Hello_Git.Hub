<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>

  <title></title>
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset-fonts-grids.css" type="text/css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui-1.8.18.custom.css" type="text/css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colorbox.css" type="text/css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css" type="text/css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/proj_i.css" type="text/css">

  <script type="text/javascript" src="${pageContext.request.contextPath}/jQuery/jquery-1.7.1.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/jQuery/jquery.tmpl.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/jQuery/jquery.ui.widget.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/jQuery/jquery-ui-1.8.18.custom.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/jQuery/jquery.ui.datepicker-ja.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/jQuery/jquery.ui.progressbar.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/jQuery/jquery.colorbox.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/jQuery/jquery.sparkline.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/jQuery/jquery.upload-1.0.2.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/jQuery/highstock.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/jQuery/jquery.autosize.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/jQuery/common.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/jQuery/jquery.pagination.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/jQuery/proj_i.js"></script>

</head>
<body class="yui-skin-sam">
  <div id="doc3" class="yui-t7" style="margin:0;">
    <div id="hd">

      <div style="background:url(${pageContext.request.contextPath}/images/head_bg.png) 0 0 repeat-x">



            <div style="padding:10px;background:url(${pageContext.request.contextPath}/images/head_bg.png) 0 0 repeat-x;height:40px;margin:auto;width:95%;">
              <div style="float:left;">
                <a href="/" class="image" style="background:url(${pageContext.request.contextPath}/images/logo.png) 0 0 no-repeat;width:142px;height:40px;">CAT4.5</a>
              </div>

              <div style="float:left;margin:15px 0 0 30px;">
                <img src="${pageContext.request.contextPath}/images/gnavi_mypage.png" alt="" style="margin:0 0 0 5px;vertical-align:middle;" />
                <a href="/" style="color:#222;font-weight:bold;vertical-align:middle;">Project List</a>


              </div>

              <div style="float:right;margin:20px 0 0 0;">

                  <span style="vertical-align:middle;">Welcome</span>
                  <span style="font-weight:bold;font-size:14px;color:#666;vertical-align:middle;">Mr. Admin</span>
                  <span style="vertical-align:middle;"></span>
                  <a href="_logout" class="button small gray" style="margin:0 0 0 10px;">Logout</a>

              </div>


                <div style="float:right;margin:22px 30px 0 0;">
                  <a href="_retain_t" class="button2 green" style="float:left;margin:0 0 0 10px;">Assigned Status</a>
                  <a href="_kpi" class="button2 green" style="float:left;margin:0 0 0 10px;">KPI</a>
                  <a href="_etc" class="button2 green" style="float:left;margin:0 0 0 10px;">Settings</a>
                  <div style="clear:both;"></div>
                </div>

              <div style="clear:both;"></div>
            </div>
            <div style="background:url(${pageContext.request.contextPath}/images/head_border.png) 0 0 repeat-x;height:4px;"></div>


      </div>



    </div>

    <div id="bd">
      <div class="yui-g">
        <div style="margin:10px auto;width:95%;min-height:500px;">
          <div style="height:1px;"></div>
          <div style="margin:10px 0 0 0;">
  <div class="title">Project Input</div>
</div>

<form action="_proj_f" method="post">
  <input type="hidden" name="f" value="proj_i" />
  <input type="hidden" name="proj_id" value="" />
  <input type="hidden" name="open" value="" />



  <table class="stripe2" style="width:100%;margin:15px 0 0 0;" border="0">
    <tr>
      <th style="text-align:left;width:100px;">Customer</th>
      <th class="mark">*</th>
      <td >

          <input id="p-search" type="text" class="search" placeholder="Search.." />
          <a id="p-reset"  style="vertical-align:middle;"><img src="${pageContext.request.contextPath}/images/x.png" alt="" style="vertical-align:middle;margin:0 10px 0 0;" /></a>


        <select id="p-select_corp" name="corp_id" style="max-width:300px" >
          <option value="">-Select-</option>

        </select>


      </td>
    </tr>
    <tr>
      <th style="text-align:left;">Service</th>
      <th class="mark">*</th>
      <td >
        <select id="p-select_serv" name="serv_id" style="max-width:300px;" >
          <option value="">-Select-</option>

        </select>
      </td>
    </tr>
    <tr>
      <th style="text-align:left;">Project Name</th>
      <th class="mark">*</th>
      <td >
        <input type="text" name="proj_name" value="" maxlength="100" style="width:200px" />
        <span style="color:#999;vertical-align:middle;margin:0 0 0 10px;">(For Eg: 1-100 character, development test support tools)</span>
      </td>
    </tr>
    <tr>
      <th style="text-align:left;">Process Name</th>
      <th class="mark">*</th>
      <td>

        <div id="p-canvas">


            <div class="p-flow">
              <input type="text" name="1-flow_name-new" value="" maxlength="100" style="width:400px;vertical-align:middle;"  />
              <img src="${pageContext.request.contextPath}/images/new.png" style="vertical-align:middle;margin:0 0 0 2px;" />
              <span style="color:#999;vertical-align:middle;margin:0 0 0 10px;">(For Eg: 1-200 character, Test Run)</span>
            </div>

        </div>

        <div style="margin:5px 0 0 0;">
          <a  class="p-add button small">+</a>
        </div>

        <div id="p-base" class="p-flow" style="margin:5px 0 0 0;display:none;">
          <input type="text" name="x-flow_name-new" value="" maxlength="200" style="width:400px;vertical-align:middle;" />
          <a class="p-del"  style="vertical-align:middle;"><img src="${pageContext.request.contextPath}/images/x.png" alt="" style="vertical-align:middle;" /></a>
          <img src="${pageContext.request.contextPath}/images/new.png" style="vertical-align:middle;margin:0 0 0 2px;" />
        </div>

      </td>
    </tr>
    <tr>
      <th style="text-align:left;">Destination Reports</th>
      <th></th>
      <td>
        <input type="text" name="report_mail" value="" maxlength="255" style="width:400px;vertical-align:middle;" />
        <span style="color:#999;vertical-align:middle;margin:0 0 0 10px;">(Eg: Character 1 ~ 255, report@shiftinc.jp)</span>
      </td>
    </tr>
    <tr>
      <th style="text-align:left;">BTS</th>
      <th class="mark">*</th>
      <td id="p-bts" >
        <div>
          <select id="p-bts_type" name="bts_type">
            <option value="">-Select-</option>
            <option value="1" >CAT</option>
            <option value="2" >Bugzilla</option>
          </select>
        </div>

        <!-- CAT -->
        <div id="p-bts_box_1" class="p-bts_box radius" style="display:none;">

          <table id="p-key_canvas" style="width:100%;">

            <tr id="p-key_base" class="p-key" style="display:none;">
              <td style="vertical-align:top;">
                <input type="text" class="p-key_name" name="x-key_name" value="" maxlength="20" style="width:100px;" />
              </td>
              <td style="vertical-align:top;">
                <div style="float:left;margin:0 5px 0 0;">
                  <a class="p-tag_add button tiny" style="vertical-align:middle;">+</a>
                </div>
                <div style="float:left;">
                  <div class="p-tag_canvas"></div>
                  <div style="clear:both;"></div>
                </div>
                <div style="clear:both;"></div>

                <div class="p-tag_base" style="float:left;display:none;margin:0 5px 0 0;">
                  <input type="text" class="p-tag_name" name="x-y-tag_name" value="" maxlength="20" style="width:100px;vertical-align:middle;" />
                  <a class="p-tag_del"  style="vertical-align:middle;"><img src="${pageContext.request.contextPath}/images/x.png" alt="" style="vertical-align:middle;" /></a>
                </div>
              </td>
              <td style="vertical-align:top;">
                <input id="p-x-key_type-1" type="radio" class="p-key_type" name="x-key_type" value="1" style="vertical-align:middle;" />
                <label for="p-x-key_type-1" style="vertical-align:middle;">Only One</label>
                <input id="p-x-key_type-2" type="radio" class="p-key_type" name="x-key_type" value="2" style="vertical-align:middle;" />
                <label for="p-s-key_type-2" style="vertical-align:middle;">Only one</label>
                <span style="vertical-align:middle;">Multiple Values</span>
                <input type="radio" class="p-key_type" name="x-key_type" value="" style="display:none;" checked="checked" />
              </td>
              <td style="vertical-align:middle;text-align:center;">
                <a class="p-key_del"  style="vertical-align:middle;"><img src="${pageContext.request.contextPath}/images/x.png" alt="" style="vertical-align:middle;" /></a>
              </td>
            </tr>

            <tr>
              <th style="width:110px;">Item Name</th>
              <th>Choices</th>
              <th style="width:170px;">Input limit</th>
              <th style="width:30px;">Delete</th>
            </tr>


              <tr class="p-key">
                <td style="vertical-align:top;">
                  <span>Status</span>
                  <input type="hidden" class="p-key_name" name="1-key_name" value="?????" />
                </td>
                <td style="vertical-align:top;">
                  <div style="float:left;">
                    <div class="p-tag_canvas">

                        <div  style="float:left;margin:0 5px 0 0;">
                          <a  class="p-tag gray button tiny no_select" style="vertical-align:middle;margin:0 0 0 3px;">A New</a>
                          <input type="hidden" class="p-tag_name" name="1-1-tag_name" value="??" />
                        </div>

                        <div  style="float:left;margin:0 5px 0 0;">
                          <a  class="p-tag gray button tiny no_select" style="vertical-align:middle;margin:0 0 0 3px;">During the launch</a>
                          <input type="hidden" class="p-tag_name" name="1-2-tag_name" value="???" />
                        </div>

                        <div  style="float:left;margin:0 5px 0 0;">
                          <a  class="p-tag gray button tiny no_select" style="vertical-align:middle;margin:0 0 0 3px;">Closed</a>
                          <input type="hidden" class="p-tag_name" name="1-3-tag_name" value="????" />
                        </div>

                        <div  style="float:left;margin:0 5px 0 0;">
                          <a  class="p-tag gray button tiny no_select" style="vertical-align:middle;margin:0 0 0 3px;">Confirmed Support</a>
                          <input type="hidden" class="p-tag_name" name="1-4-tag_name" value="??????" />
                        </div>

                        <div  style="float:left;margin:0 5px 0 0;">
                          <a  class="p-tag gray button tiny no_select" style="vertical-align:middle;margin:0 0 0 3px;">Resumption</a>
                          <input type="hidden" class="p-tag_name" name="1-5-tag_name" value="??" />
                        </div>

                        <div  style="float:left;margin:0 5px 0 0;">
                          <a  class="p-tag gray button tiny no_select" style="vertical-align:middle;margin:0 0 0 3px;">Close</a>
                          <input type="hidden" class="p-tag_name" name="1-6-tag_name" value="???" />
                        </div>

                    </div>
                    <div style="clear:both;"></div>
                  </div>
                  <div style="clear:both;"></div>
                </td>
                <td style="vertical-align:top;text-align:center;">
                  <input type="hidden" class="p-key_type" name="1-key_type" value="1" />
                  It is only one possible choice
                </td>
                <td style="vertical-align:middle;text-align:center;"></td>
              </tr>

              <tr class="p-key">
                <td style="vertical-align:top;">
                  <span>Classification</span>
                  <input type="hidden" class="p-key_name" name="2-key_name" value="??" />
                </td>
                <td style="vertical-align:top;">
                  <div style="float:left;">
                    <div class="p-tag_canvas">

                        <div  style="float:left;margin:0 5px 0 0;">
                          <a  class="p-tag gray button tiny no_select" style="vertical-align:middle;margin:0 0 0 3px;">Question</a>
                          <input type="hidden" class="p-tag_name" name="2-1-tag_name" value="??" />
                        </div>

                        <div  style="float:left;margin:0 5px 0 0;">
                          <a  class="p-tag gray button tiny no_select" style="vertical-align:middle;margin:0 0 0 3px;">Bug</a>
                          <input type="hidden" class="p-tag_name" name="2-2-tag_name" value="???" />
                        </div>

                        <div  style="float:left;margin:0 5px 0 0;">
                          <a  class="p-tag gray button tiny no_select" style="vertical-align:middle;margin:0 0 0 3px;">Demand</a>
                          <input type="hidden" class="p-tag_name" name="2-3-tag_name" value="??" />
                        </div>

                    </div>
                    <div style="clear:both;"></div>
                  </div>
                  <div style="clear:both;"></div>
                </td>
                <td style="vertical-align:top;text-align:center;">
                  <input type="hidden" class="p-key_type" name="2-key_type" value="1" />
                  It is only one possible choice
                </td>
                <td style="vertical-align:middle;text-align:center;"></td>
              </tr>

              <tr class="p-key">
                <td style="vertical-align:top;">
                  <span>Priority</span>
                  <input type="hidden" class="p-key_name" name="3-key_name" value="???" />
                </td>
                <td style="vertical-align:top;">
                  <div style="float:left;">
                    <div class="p-tag_canvas">

                        <div  style="float:left;margin:0 5px 0 0;">
                          <a  class="p-tag gray button tiny no_select" style="vertical-align:middle;margin:0 0 0 3px;">P1</a>
                          <input type="hidden" class="p-tag_name" name="3-1-tag_name" value="P1" />
                        </div>

                        <div  style="float:left;margin:0 5px 0 0;">
                          <a  class="p-tag gray button tiny no_select" style="vertical-align:middle;margin:0 0 0 3px;">P2</a>
                          <input type="hidden" class="p-tag_name" name="3-2-tag_name" value="P2" />
                        </div>

                        <div  style="float:left;margin:0 5px 0 0;">
                          <a  class="p-tag gray button tiny no_select" style="vertical-align:middle;margin:0 0 0 3px;">P3</a>
                          <input type="hidden" class="p-tag_name" name="3-3-tag_name" value="P3" />
                        </div>

                        <div  style="float:left;margin:0 5px 0 0;">
                          <a  class="p-tag gray button tiny no_select" style="vertical-align:middle;margin:0 0 0 3px;">P4</a>
                          <input type="hidden" class="p-tag_name" name="3-4-tag_name" value="P4" />
                        </div>

                        <div  style="float:left;margin:0 5px 0 0;">
                          <a  class="p-tag gray button tiny no_select" style="vertical-align:middle;margin:0 0 0 3px;">P5</a>
                          <input type="hidden" class="p-tag_name" name="3-5-tag_name" value="P5" />
                        </div>

                    </div>
                    <div style="clear:both;"></div>
                  </div>
                  <div style="clear:both;"></div>
                </td>
                <td style="vertical-align:top;text-align:center;">
                  <input type="hidden" class="p-key_type" name="3-key_type" value="1" />
                  It is only one possible choice
                </td>
                <td style="vertical-align:middle;text-align:center;"></td>
              </tr>

              <tr class="p-key">
                <td style="vertical-align:top;">
                  <span>Result</span>
                  <input type="hidden" class="p-key_name" name="4-key_name" value="??" />
                </td>
                <td style="vertical-align:top;">
                  <div style="float:left;">
                    <div class="p-tag_canvas">

                        <div  style="float:left;margin:0 5px 0 0;">
                          <a  class="p-tag gray button tiny no_select" style="vertical-align:middle;margin:0 0 0 3px;">Specification</a>
                          <input type="hidden" class="p-tag_name" name="4-1-tag_name" value="??" />
                        </div>

                        <div  style="float:left;margin:0 5px 0 0;">
                          <a  class="p-tag gray button tiny no_select" style="vertical-align:middle;margin:0 0 0 3px;">Pre-Novation Bug</a>
                          <input type="hidden" class="p-tag_name" name="4-2-tag_name" value="??????" />
                        </div>

                        <div  style="float:left;margin:0 5px 0 0;">
                          <a  class="p-tag gray button tiny no_select" style="vertical-align:middle;margin:0 0 0 3px;">Next Renovation Bug</a>
                          <input type="hidden" class="p-tag_name" name="4-3-tag_name" value="???????" />
                        </div>

                        <div  style="float:left;margin:0 5px 0 0;">
                          <a  class="p-tag gray button tiny no_select" style="vertical-align:middle;margin:0 0 0 3px;">Overlap</a>
                          <input type="hidden" class="p-tag_name" name="4-4-tag_name" value="??" />
                        </div>

                        <div  style="float:left;margin:0 5px 0 0;">
                          <a  class="p-tag gray button tiny no_select" style="vertical-align:middle;margin:0 0 0 3px;">Not Produced</a>
                          <input type="hidden" class="p-tag_name" name="4-5-tag_name" value="?????" />
                        </div>

                    </div>
                    <div style="clear:both;"></div>
                  </div>
                  <div style="clear:both;"></div>
                </td>
                <td style="vertical-align:top;text-align:center;">
                  <input type="hidden" class="p-key_type" name="4-key_type" value="1" />
                  It is only one possible choice
                </td>
                <td style="vertical-align:middle;text-align:center;"></td>
              </tr>




          </table>
          <div style="margin:3px 0 0 0;">
            <a class="p-key_add button small">+</a>
          </div>
          <div style="margin:3px 0 0 0;">
            <div>Format Text</div>
            <textarea name="format_text" style="width:80%;height:1em;"></textarea>
          </div>
        </div>

        <!-- Bugzilla -->
        <div id="p-bts_box_2" class="p-bts_box radius" style="display:none;">
          <table class="stripe" style="width:100%;">
            <tr class="stripe">
              <th style="width:100px;text-align:left;">URL</th>
              <td >
                <input type="text" name="bugzilla_url" value="" maxlength="255" style="width:400px;" />
              </td>
            </tr>
            <tr>
              <th style="text-align:left;">Bugzilla End</th>
              <td >
                <input type="text" name="bugzilla_end" value="" maxlength="255" style="width:400px;" />
              </td>
            </tr>
          </table>
        </div>

      </td>
    </tr>
  </table>

  <div style="margin:15px 0 5px 0;">
    <a id="p-more"  style="vertical-align:middle;margin:0 0 0 5px;" onmouseover="this.style.cursor='pointer';" >&raquo; More information</a>
  </div>
  <div id="p-more_table" class="radius" style="padding:15px;border:1px solid #ddd;background-color:#eee;display:none;">
    <table class="stripe" style="width:100%;">
      <tr>
        <th style="text-align:left;width:100px;">To be tested</th>
        <th class="mark"></th>
        <td >
          <input type="text" name="target" value="" maxlength="40" style="width:200px;" />
          <span style="color:#999;vertical-align:middle;margin:0 0 0 10px;">WEB (for example-Mobile smartphone, accounting system, up to 40 characters)</span>
        </td>
      </tr>
      <tr>
        <th style="text-align:left;">Classification system</th>
        <th class="mark"></th>
        <td >
          <input type="text" name="sys_type" value="" maxlength="40" style="width:200px;" />
          <span style="color:#999;vertical-align:middle;margin:0 0 0 10px;">(Example-Front , batch, form up to 40 characters)</span>
        </td>
      </tr>
      <tr>
        <th style="text-align:left;">Testing Phase</th>
        <th class="mark"></th>
        <td >
          <input type="text" name="phase" value="" maxlength="40" style="width:200px;" />
          <span style="color:#999;vertical-align:middle;margin:0 0 0 10px;">(for example-alone, combined together, accepting a maximum of 40 characters)</span>
        </td>
      </tr>
      <tr>
        <th style="text-align:left;">Number of functions</th>
        <th class="mark"></th>
        <td >
          <input type="text" name="n_func" value="" maxlength="9" style="width:80px;" />
          <span style="color:#999;vertical-align:middle;margin:0 0 0 10px;">Within a nine-digit integer</span>
        </td>
      </tr>
      <tr>
        <th style="text-align:left;">Number of screens</th>
        <th class="mark"></th>
        <td >
          <input type="text" name="n_screen" value="" maxlength="9" style="width:80px;" />
          <span style="color:#999;vertical-align:middle;margin:0 0 0 10px;">Within a nine-digit integer</span>
        </td>
      </tr>
      <tr>
        <th style="text-align:left;">Master case number</th>
        <th class="mark"></th>
        <td >
          <input type="text" name="n_master" value="" maxlength="9" style="width:80px;" />
          <span style="color:#999;vertical-align:middle;margin:0 0 0 10px;">Please enter the number of cases that will be the master within a nine-digit integer</span>
        </td>
      </tr>
      <tr>
        <th style="text-align:left;">Actual design work</th>
        <th class="mark"></th>
        <td >
          <input type="text" name="t_design_fixed" value="" maxlength="9" style="width:80px;" />
          <span style="color:#999;vertical-align:middle;margin:0 0 0 10px;">Person-days within a nine-digit integer</span>
        </td>
      </tr>
      <tr>
        <th style="text-align:left;">Man-hour performance run</th>
        <th class="mark"></th>
        <td >
          <input type="text" name="t_test_fixed" value="" maxlength="9" style="width:80px;" />
          <span style="color:#999;vertical-align:middle;margin:0 0 0 10px;">Person-days within a nine-digit integer</span>
        </td>
      </tr>
      <tr>
        <th style="text-align:left;">Estimated amount</th>
        <th class="mark"></th>
        <td >
          <input type="text" name="p_budget" value="" maxlength="9" style="width:80px;" />
          <span style="color:#999;vertical-align:middle;margin:0 0 0 10px;">9-digit integer within yen</span>
        </td>
      </tr>
      <tr>
        <th style="text-align:left;">Actual amount</th>
        <th class="mark"></th>
        <td >
          <input type="text" name="p_fixed" value="" maxlength="9" style="width:80px;" />
          <span style="color:#999;vertical-align:middle;margin:0 0 0 10px;">9-digit integer within yen</span>
        </td>
      </tr>
    </table>
  </div>

  <div style="margin:30px 0 40px 0;text-align:center;">

      <a href="_proj_l" class="button large" style="width:80px;">Cancel</a>


    <input type="submit" value="Sign Up" class="button green large" style="margin:0 0 0 30px;width:110px;" />
  </div>
</form>
<div id="p-corp_id" style="display:none;"></div>
<div id="p-serv_id" style="display:none;"></div>

        </div>
      </div>
    </div>

    <div id="ft">

        <div style="padding:5px;background-color:#009485;color:#fff;">
          <div style="width:95%;margin:auto;">
            <div style="float:left;">
              <span>Copyright &copy; 2012 SHIFTINC. All rights reserved.</span>
            </div>
            <div style="float:right;">Ver 4.5.121</div>
            <div style="clear:both;"></div>
          </div>
        </div>

    </div>
  </div>
  <div style="display:none">
  <div id="u-conf" class="radius" style="border:3px solid #ccc;padding:30px 60px;text-align:left;">
    <div class="u-str"></div>
    <div style="margin:30px 0 0 0">
      <a class="u-ok button green"  style="width:80px;text-align:center;">OK</a>
      <a class="u-cancel button gray"  style="margin:0 0 0 10px;width:80px;text-align:center;">Cancel</a>
    </div>
  </div>

  <div id="u-alert" class="radius" style="border:3px solid #ccc;padding:30px 60px;text-align:left;">
    <div class="u-str" style="text-align:center;"></div>
    <div style="margin:30px 0 0 0;text-align:center;">
      <a class="u-ok button"  style="margin:0 auto 0 auto;width:80px;text-align:center;">OK</a>
      <div style="clear:both"></div>
    </div>
  </div>
</div>

</body>
</html>

<script id="p-tree-tmpl" type="text/x-jquery-tmpl">
  <dt><a href="#"><span>-Select-</span></a></dt>
  <dd>
    <ul>
      {{if Trees.length}}
        {{each(x,p) Trees}}
          <li><a class="${p.type} ${p.enabled} ${p.selected}" href="#">${p.name}<span class="value">${p.value}</span></a></li>
        {{/each}}
      {{else}}
          <li><a class="selected" href="#">--??--<span class="value"></span></a></li>
      {{/if}}
    </ul>
  </dd>
</script>
<div id="users-div" style="position:absolute;display:none;background-color:#fff;z-index:1000;"></div>
<script id="users-tmpl" type="text/x-jquery-tmpl">
  <div style="border:3px solid #eee;background-color:#fefefe;padding:10px;">
    {{if Users.length}}
      {{each(x,p) Users}}
        {{if p.file_key}}
          <img src="/f/${p.file_key}-s/${p.corp_id}" alt="" style="width:20px;vertical-align:middle;border:1px solid #ddd;padding:1px;" />
        {{else}}
          <img src="/f/no-image/1" alt="" style="width:20px;vertical-align:middle;border:1px solid #ddd;padding:1px;" />
        {{/if}}
        <span style="vertical-align:middle;">${p.user_name}</span>
      {{/each}}
    {{else}}
      <div style="color:#999;">NO USER</div>
    {{/if}}
  </div>
</script>
<div id="points-div" style="position:absolute;display:none;background-color:#fff;z-index:1000;"></div>
<script id="points-tmpl" type="text/x-jquery-tmpl">
  <div style="border:3px solid #eee;background-color:#fefefe;padding:10px;" class="radius">
    <div style="height:165px;overflow:hidden;">
      <img src="http://chart.apis.google.com/chart?chf=bg,s,65432100&amp;cht=r&amp;chd=t:${vals_str}&amp;chs=200x200&amp;chls=3,0,0&amp;chxt=x,y&amp;chxl=0:|???|????|????|?????|?????|1:|||||&amp;chm=B,FF990080,0,0,5" style="width:200px;height:200px;margin:10px 0 0 0;">
    </div>
    <div>
      {{if point6}}
        <span>??</span>
        <span>${point6}</span>
        <span style="margin:0 10px 0 0;">?</span>
      {{/if}}
      {{if point7}}
        <span>??</span>
        <span>${point7}</span>
        <span>?</span>
      {{/if}}
    </div>

    <table class="stripe" style="width:100%;margin:5px 0 0 0;">
      <tr>
        <th style="line-height:1.5em;">????</th>
        <th style="line-height:1.5em;">??????</th>
        <th style="line-height:1.5em;">??</th>
        <th style="line-height:1.5em;">?????</th>
        <th style="line-height:1.5em;">????</th>
        <th style="line-height:1.5em;">???</th>
      </tr>

      {{if List.length}}
        {{each(x,p) List}}
          <tr>
            <td style="line-height:1.5em;text-align:left">${p.serv_name}</td>
            <td style="line-height:1.5em;text-align:left">${p.proj_name}</td>
            <td style="line-height:1.5em;text-align:left">${p.flow_name}</td>
            <td style="line-height:1.5em;text-align:left">${p.part_name}</td>
            <td style="line-height:1.5em;text-align:center;">${p.work_time}</td>
            <td style="line-height:1.5em;text-align:center;">${p.n_done_f}</td>
          </tr>
        {{/each}}
      {{else}}
        <tr>
          <td colspan="6" class="no_data">??????????????</td>
        </tr>
      {{/if}}
    </table>
  </div>
</script>
<div id="table-retain-div" style="position:absolute;display:none;background-color:#fff;z-index:1000;"></div>
<script id="table-retain-tmpl" type="text/x-jquery-tmpl">
  <div style="border:3px solid #eee;background-color:#fefefe;padding:10px;" class="radius">
    <table class="stripe" style="width:100%;">
      <tr>
        <th style="line-height:1.5em;">?????</th>
        <th style="line-height:1.5em;">????</th>
        <th style="line-height:1.5em;">??????</th>
        <th style="line-height:1.5em;">??</th>
      </tr>

      {{if Retains.length}}
        {{each(x,p) Retains}}
          <tr>
            <td style="line-height:1.5em;text-align:center;">${p.retain_day_f}</td>
            <td style="line-height:1.5em;text-align:left;">${p.serv_name}</td>
            <td style="line-height:1.5em;text-align:left;">${p.proj_name}</td>
            <td style="line-height:1.5em;text-align:left;">${p.flow_name}</td>
          </tr>
        {{/each}}
      {{else}}
        <tr>
          <td colspan="4" class="no_data">??????????????</td>
        </tr>
      {{/if}}
    </table>
  </div>
</script>
<div id="table-assign-div" style="position:absolute;display:none;background-color:#fff;z-index:1000;"></div>
<script id="table-assign-tmpl" type="text/x-jquery-tmpl">
  <div style="border:3px solid #eee;background-color:#fefefe;padding:10px;" class="radius">
    <table class="stripe" style="width:100%;">
      <tr>
        <th style="line-height:1.5em;">???</th>
        <th style="line-height:1.5em;">????</th>
        <th style="line-height:1.5em;">??????</th>
        <th style="line-height:1.5em;">??</th>
      </tr>

      {{if Assigns.length}}
        {{each(x,p) Assigns}}
          <tr>
            <td style="line-height:1.5em;text-align:center;">${p.assign_day_f}</td>
            <td style="line-height:1.5em;text-align:left;">${p.serv_name}</td>
            <td style="line-height:1.5em;text-align:left;">${p.proj_name}</td>
            <td style="line-height:1.5em;text-align:left;">${p.flow_name}</td>
          </tr>
        {{/each}}
      {{else}}
        <tr>
          <td colspan="4" class="no_data">??????????????</td>
        </tr>
      {{/if}}
    </table>
  </div>
</script>
<!-- 31816(chars),33018(bytes)-->
