SET IDENTITY_INSERT [IdentityServer].[ClientScopes] ON 
 
INSERT [IdentityServer].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (4, N'profile', 2)
INSERT [IdentityServer].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (5, N'profile', 3)
 
SET IDENTITY_INSERT [IdentityServer].[ClientScopes] OFF

INSERT INTO IdentityServer.AspNetUserClaims (ClaimType, ClaimValue, UserId)
SELECT 'family_name' AS ClaimType, users.FamilyName, users.Id 
FROM IdentityServer.AspNetUsers AS users
WHERE NOT EXISTS (SELECT UserId FROM IdentityServer.AspNetUserClaims claims WHERE claims.ClaimType = 'family_name' AND claims.UserId = users.Id)

INSERT INTO IdentityServer.AspNetUserClaims (ClaimType, ClaimValue, UserId)
SELECT 'given_name' AS ClaimType, users.GivenName, users.Id 
FROM IdentityServer.AspNetUsers AS users
WHERE NOT EXISTS (SELECT UserId FROM IdentityServer.AspNetUserClaims claims WHERE claims.ClaimType = 'given_name' AND claims.UserId = users.Id)
