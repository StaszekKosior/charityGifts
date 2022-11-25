<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/fragments/header.jsp"/>

<div class="slogan container container--90">
    <div class="slogan--item">
        <h1>
            Oddaj rzeczy, których już nie chcesz<br/>
            <span class="uppercase">potrzebującym</span>
        </h1>

        <div class="slogan--steps">
            <div class="slogan--steps-title">Wystarczą 4 proste kroki:</div>
            <ul class="slogan--steps-boxes">
                <li>
                    <div><em>1</em><span>Wybierz rzeczy</span></div>
                </li>
                <li>
                    <div><em>2</em><span>Spakuj je w worki</span></div>
                </li>
                <li>
                    <div><em>3</em><span>Wybierz fundację</span></div>
                </li>
                <li>
                    <div><em>4</em><span>Zamów kuriera</span></div>
                </li>
            </ul>
        </div>
    </div>
</div>
</header>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="2">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="3">
                Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>

        <form:form method="post" modelAttribute="donation">
            <form:hidden path="id"/>

            <!-- STEP 1: class .active is switching steps -->
            <div data-step="1" class="active">
                <h3>Zaznacz co chcesz oddać:</h3>


                <c:forEach var="category" items="${categories}">
                    <div class="form-group form-group--checkbox">
                        <label>
                            <input
                                    type="checkbox"
                                    name="categories"
                                    value="${category.id}"/>
                            <span class="checkbox"></span>
                            <span class="description">${category.name}</span>
                        </label>

                    </div>
                </c:forEach>
                <form:errors path="categories" cssStyle="color : red"/>


                <div class="form-group form-group--buttons">
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 2 -->
            <div data-step="2">
                <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

                <div class="form-group form-group--inline">
                    <label>
                        Liczba 60l worków:
                        <form:input type="number" path="quantity"/>
                        <form:errors path="quantity" cssStyle="color : red"/>
                    </label>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 3 -->
            <div data-step="3">
                <h3>Wybierz organizacje, której chcesz pomóc:</h3>

                <c:forEach var="institution" items="${institutions}">
                    <div class="form-group form-group--checkbox">
                        <label>
                            <input type="radio" name="institution" value="${institution.id}"/>
                            <span class="checkbox radio"></span>
                            <span class="description">
                                      <div class="title">${institution.name}</div>
                                      <div class="subtitle">
                                              ${institution.description}
                                      </div>
                                    </span>
                        </label>
                    </div>
                </c:forEach>
                <form:errors path="institution" cssStyle="color : red"/>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 4 -->
            <div data-step="4">
                <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4>Adres odbioru</h4>
                        <div class="form-group form-group--inline">
                            <form:label path="street"> Ulica
                                <form:input path="street" type="text"/>
                                <form:errors path="street" cssStyle="color : red"/>
                            </form:label>
                        </div>

                        <div class="form-group form-group--inline">
                            <form:label path="city"> Miasto
                                <form:input path="city" type="text"/>
                                <form:errors path="city" cssStyle="color : red"/>
                            </form:label>
                        </div>

                        <div class="form-group form-group--inline">
                            <form:label path="zipCode"> Kod pocztowy
                                <form:input path="zipCode" type="text"
                                            pattern="^\d{2}-\d{3}$" maxlength="6"/>
                                <form:errors path="zipCode" cssStyle="color : red"/>
                            </form:label>
                        </div>

                        <div class="form-group form-group--inline">
                            <form:label path="phoneNumber"> Numer telefonu
                                <form:input path="phoneNumber" type="tel" pattern="[0-9]{9}" maxlength="9"/>
                                <form:errors path="phoneNumber" cssStyle="color : red"/>
                            </form:label>
                        </div>
                    </div>

                    <div class="form-section--column">
                        <h4>Termin odbioru</h4>
                        <div class="form-group form-group--inline">
                            <form:label path="pickUpDate"> Data
                                <form:input path="pickUpDate" type="date"/>
                                <form:errors path="pickUpDate" cssStyle="color : red"/>
                            </form:label>
                        </div>

                        <div class="form-group form-group--inline">
                            <form:label path="pickUpTime"> Godzina
                                <form:input path="pickUpTime" type="time"/>
                                <form:errors path="pickUpTime" cssStyle="color : red"/>
                            </form:label>
                        </div>

                        <div class="form-group form-group--inline">
                            <form:label path="pickUpComment"> Uwagi dla kuriera
                                <form:textarea path="pickUpComment" type="text"/>
                            </form:label>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <form:button class="btn">Dalej</form:button>
                </div>
            </div>
        </form:form>
    </div>
</section>


<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/fragments/footer.jsp"/>
