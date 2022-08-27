<%-- 
    Document   : addGuard
    Created on : Jun 28, 2022, 2:51:39 PM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="addGuard${schedule.id}" tabindex="-1" aria-labelledby="addGuardLabel" aria-hidden="true" data-bs-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addGuard${schedule.id}Label">Thêm người gác</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form id="addGuard${schedule.id}Form" action="HandleGuard" method="post">

                    <input type="text" name="status" value="1" hidden/>

                    <div class="form-group mt-2">
                        <label for="" class="form-label fw-bold">Số người gác</label>
                        <input type="number" id="" class="form-control" 
                               value="${locationDAO.locations.get(schedule.locationId).numOfGuard}" disabled>
                    </div>

                    <div class="form-group mt-3 mb-3 row">
                        <label for="" class="fw-bold">Chọn người gác</label>

                        <div class="col-4 mb-2">
                            <label for="">Lớp</label>
                            <select name="classId" id="" class="form-select">
                                <c:forEach items="${classDAO.classes}" var="cl">
                                    <option value="${cl.key}">${cl.value.name}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="col-8 mb-2">
                            <label for="">Sinh viên</label>
                            <select name="studentId" id="" class="form-select">
                                <c:forEach items="${studentDAO.students}" var="st">
                                    <option value="${st.id}" class="${st.classId}">${st.name} - ${st.id}</option>
                                </c:forEach>
                            </select>
                        </div>
                        
                        <input type="text" name="scheduleId" value="${schedule.id}" hidden/>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" form="addGuard${schedule.id}Form" class="btn btn-success">Thêm</button>
            </div>
        </div>
    </div>
</div>
<script>

    $("select[name='studentId']").ready(function () {
        var target = $("select[name='classId'] option:checked").val();
        console.log(target);
        $("select[name='studentId'] > option").each(function () {
            if (this.className == target) {
                this.style.display = 'block';
            }
        });

        $("select[name='studentId'] > option").each(function () {
            if (this.className != target) {
                this.style.display = 'none';
            }
        });

        var value = $("option[class=" + target + "]").first().val();
        $("select[name='studentId']").val(value).change();
    });

    $(function () {
        $("select[name='classId']").on("change", function () {
            var target = $("select[name='classId'] option:checked").val();
            
            $("select[name='studentId'] > option").each(function () {
                if (this.className == target) {
                    console.log(this.className);
                    this.style.display = 'block';
                }
            });
            
            $("select[name='studentId'] > option").each(function () {
                if (this.className != target) {
                    this.style.display = 'none';
                }
            });
            
            var value = $("option[class=" + target + "]").first().val();
            
//            console.log(value);
            $("select[name='studentId']").val(value).change();
        });
    });
</script>