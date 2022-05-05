﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UiMeta.ascx.cs" Inherits="WebPhimV1.Control_NguoiDung.UiMeta" %>



<!-- Primary Meta Tags -->
<meta name="title" content="<%= listCauHinh.ten_web %>">
<meta name="description" content="<%= listCauHinh.ten_web %>">

<!-- Open Graph / Facebook -->
<meta property="og:type" content="website">
<meta property="og:url" content="<%=WebPhimV1.Code.HeThong.url() %>">
<meta property="og:title" content="<%=WebPhimV1.Code.HeThong.url() %>">
<meta property="og:description" content="<%=WebPhimV1.Code.HeThong.url() %>">
<meta property="og:image" content="<%=WebPhimV1.Code.HeThong.url() %>/public/img/www/logo/<%=listCauHinh.logo_web %>">

<!-- Twitter
<meta property="twitter:card" content="summary_large_image">
<meta property="twitter:url" content="https://metatags.io/">
<meta property="twitter:title" content="Meta Tags — Preview, Edit and Generate">
<meta property="twitter:description" content="With Meta Tags you can edit and experiment with your content then preview how your webpage will look on Google, Facebook, Twitter and more!">
<meta property="twitter:image" content="https://metatags.io/assets/meta-tags-16a33a6a8531e519cc0936fbba0ad904e52d35f34a46c97a2c9f6f7dd7d336f2.png">
 -->