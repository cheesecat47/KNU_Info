<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="include/head.jsp" %>
</head>
<body>
<div id="contents">
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
                <div class="card-body">
                    <h4 class="card-title text-center">접속자 정보</h4>
                    <div class="form-label-group">
                        <h5><b>IP:</b> <%=request.getRemoteAddr()%></h5>
                    </div>
                    <br>
                    <div class="form-label-group">
                        <h5><b>Session ID: </b> <%=session.getId()%></h5>
                    </div>
                    <br>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="include/bootstrapjs.jsp" %>
</body>
</html>
