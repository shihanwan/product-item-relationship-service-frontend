import { useQuery } from "@tanstack/react-query";
import { keycloak } from "../../lib/keycloak";

export const getUserInfo = () => {
  return useQuery(["userInfo"], async () => { return (await keycloak.loadUserInfo()) as { name: string; tenant: string }; }, {});
    return (await keycloak.loadUserInfo()) as { name: string; tenant: string };
  });
};
