﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="emaildigest.ascx.cs"
    Inherits="YAF.Controls.emaildigest" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Linq" %>
<%@ Import Namespace="YAF.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="YafHead" runat="server">
    <title>Digest Notification</title>
</head>
<body id="yaf_digest">
    <div class="emailcontainer">
        <div class="top">
            <h1 class="title">
                <a href="<%=YafBuildLink.GetLink(ForumPages.forum, true)%>">
                    <%= PageContext.BoardSettings.Name %></a></h1>
            <h1 class="date">
                <%=YafServices.DateTime.FormatDateLong(DateTime.Now)%>
            </h1>
            <br />
        </div>
        <div class="main">
            <% if (this.NewTopics.Any())
               {%>
            <h1 class="header">
                <%=this.GetText("NEWTOPICS")%></h1>
            <%
                foreach (var f in this.NewTopics)
                {%>
            <h2 class="forumTitle">
                <%=f.Key.Name%>
            </h2>
            <%
                foreach (var t in f.OrderByDescending(x => x.LastPostDate))
                {%>
            <div class="topic">
                <h3>
                    <a class="subject" href="<%=YafBuildLink.GetLink(ForumPages.posts, true, "m={0}#post{0}", t.LastMessageID)%>"
                        target="_blank">
                        <%=t.Subject%></a> <a class="comments" href="<%=YafBuildLink.GetLink(ForumPages.posts, true, "m={0}#post{0}", t.LastMessageID)%>"
                            target="_blank">
                            <%=this.GetText("COMMENTS").FormatWith(t.Replies)%></a></h3>
                <h5>
                    <%=this.GetText("STARTEDBY").FormatWith(t.StartedUserName)%></h5>
                <div class="shortpost">
                    <span class="text">
                        <%=this.GetMessageFormattedAndTruncated(t.LastMessage, 200)%>
                    </span><a href="<%=YafBuildLink.GetLink(ForumPages.posts, true, "m={0}#post{0}", t.LastMessageID)%>"
                        class="link" target="_blank">
                        <%=this.GetText("LINK")%></a> <span class="by">
                            <%=this.GetText("LASTBY").FormatWith(t.LastUserName)%>
                        </span>
                </div>
            </div>
            <%
                }
                 }
               }%>
            <% if (this.ActiveTopics.Any())
               {%>
            <h1 class="header">
                <%=this.GetText("ACTIVETOPICS")%></h1>
            <%
                foreach (var f in this.ActiveTopics)
                {%>
            <h2 class="forumTitle">
                <%=f.Key.Name%>
            </h2>
            <%
                foreach (var t in f.OrderBy(x => x.Replies))
                {%>
            <div class="topic">
                <h3>
                    <a class="subject" href="<%=YafBuildLink.GetLink(ForumPages.posts, true, "m={0}#post{0}", t.LastMessageID)%>"
                        target="_blank">
                        <%=t.Subject%></a> <a class="comments" href="<%=YafBuildLink.GetLink(ForumPages.posts, true, "m={0}#post{0}", t.LastMessageID)%>"
                            target="_blank">
                            <%=this.GetText("COMMENTS").FormatWith(t.Replies)%></a></h3>
                <h5>
                    <%=this.GetText("STARTEDBY").FormatWith(t.StartedUserName)%></h5>
                <div class="shortpost">
                    <span class="text">
                        <%=this.GetMessageFormattedAndTruncated(t.LastMessage, 200)%>
                    </span><a href="<%=YafBuildLink.GetLink(ForumPages.posts, true, "m={0}#post{0}", t.LastMessageID)%>"
                        class="link" target="_blank">
                        <%=this.GetText("LINK")%></a> <span class="by">
                            <%=this.GetText("LASTBY").FormatWith(t.LastUserName)%>
                        </span>
                </div>
            </div>
            <%
                }
                 }
               }%></div>
        <div class="bottom">
            <%=this.GetText("REMOVALTEXT") %>
            <a href="<%=YafBuildLink.GetLink(ForumPages.cp_subscriptions, true) %>" class="removelink">
                <%=this.GetText("REMOVALLINK") %></a>
        </div>
    </div>
</body>
</html>
