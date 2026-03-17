// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace Microsoft.EServices.EDocumentConnector.ForNAV;
codeunit 6413 "ForNAV Peppol Upgrade"
{
    Subtype = Upgrade;
    Access = Internal;

    trigger OnUpgradePerCompany()
    begin
        UpdateEndpoint();
    end;

    internal procedure UpdateEndpoint()
    var
        PeppolOauth: Codeunit "ForNAV Peppol Oauth";
        NewScopes: Text;
    begin
        if not PeppolOauth.TryGetNewEndpointScope(PeppolOauth.GetDefaultEndpoint(), NewScopes) then
            exit;

        if NewScopes = '' then
            exit;

        PeppolOauth.ValidateScope(NewScopes);
        PeppolOauth.ValidateEndpoint(PeppolOauth.GetDefaultEndpoint());
    end;
}