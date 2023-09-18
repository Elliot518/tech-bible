#!/usr/bin/env bash

mkdir mcp-ddd-skeleton
cd mcp-ddd-skeleton

spring init \
--boot-version=3.1.3 \
--type=gradle-project \
--java-version=17 \
--packaging=jar \
--name=mcp-infrastructure \
--package-name=com.mcp.ddd.skeleton.infra \
--groupId=com.mcp \
--version=1.0.0.RELEASE \
mcp-infrastructure

spring init \
--boot-version=3.1.3 \
--type=gradle-project \
--java-version=17 \
--packaging=jar \
--name=mcp-domain \
--package-name=com.mcp.ddd.skeleton.domain \
--groupId=com.mcp \
--version=1.0.0.RELEASE \
mcp-domain

spring init \
--boot-version=3.1.3 \
--type=gradle-project \
--java-version=17 \
--packaging=jar \
--name=mcp-application \
--package-name=com.mcp.ddd.skeleton.application \
--groupId=com.mcp \
--version=1.0.0.RELEASE \
mcp-application

spring init \
--boot-version=3.1.3 \
--type=gradle-project \
--java-version=17 \
--packaging=jar \
--name=mcp-api \
--package-name=com.mcp.ddd.skeleton.api \
--groupId=com.mcp \
--dependencies=actuator,webflux \
--version=1.0.0.RELEASE \
mcp-api

cd ..