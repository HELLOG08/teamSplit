<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%
    // 고정된 이름 배열
    List<String> groupA = Arrays.asList("여자1호", "여자2호", "여자3호"); // 여성
    List<String> groupB = Arrays.asList("남자1호", "남자2호", "남자3호"); // 남성

    List<String> team1 = new ArrayList<>();
    List<String> team2 = new ArrayList<>();
    List<String> team3 = new ArrayList<>();

    List<List<String>> allTeams = new ArrayList<>();

    // POST 요청일 때만 팀을 섞음
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        List<String> shuffledA = new ArrayList<>(groupA);
        List<String> shuffledB = new ArrayList<>(groupB);

        Collections.shuffle(shuffledA);
        Collections.shuffle(shuffledB);

        team1 = Arrays.asList(shuffledA.get(0), shuffledB.get(0));
        team2 = Arrays.asList(shuffledA.get(1), shuffledB.get(1));
        team3 = Arrays.asList(shuffledA.get(2), shuffledB.get(2));

        allTeams = Arrays.asList(team1, team2, team3);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>2:2:2 고정 이름 팀 나누기</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 30px;
        }
        .container {
            max-width: 500px;
            margin: auto;
        }
        button {
            width: 100%;
            height: 40px;
            font-size: 16px;
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        button:hover {
            background-color: #218838;
        }
        .teams {
            display: flex;
            justify-content: space-between;
        }
        .team {
            width: 30%;
            background-color: #f8f9fa;
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 15px;
        }
        .team h3 {
            text-align: center;
        }
        h2{
        	text-align: center;
        }
        ul {
            list-style: none;
            padding-left: 0;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>2:2:2 팀 나누기</h2>
    <form method="post">
        <button type="submit">랜덤 팀 나누기</button>
    </form>

    <%
        if (!allTeams.isEmpty()) {
    %>
    <div class="teams">
        <% for (int i = 0; i < allTeams.size(); i++) { %>
        <div class="team">
            <h3>Team <%= i + 1 %></h3>
            <ul>
                <% for (String member : allTeams.get(i)) { %>
                    <li><%= member %></li>
                <% } %>
            </ul>
        </div>
        <% } %>
    </div>
    <%
        }
    %>
</div>
</body>
</html>
